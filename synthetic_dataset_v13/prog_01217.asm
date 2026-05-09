; DESCRIPTION: Places a red 55x38 rectangle at position (392, 202).
; PLAN: r0=392(x), r1=202(y), r2=55(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 202
LDI r2, 55
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
