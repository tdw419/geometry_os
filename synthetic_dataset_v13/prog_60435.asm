; DESCRIPTION: Places a red 10x38 rectangle at position (128, 174).
; PLAN: r0=128(x), r1=174(y), r2=10(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 174
LDI r2, 10
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
