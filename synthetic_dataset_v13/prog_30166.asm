; DESCRIPTION: Places a red 10x64 rectangle at position (370, 144).
; PLAN: r0=370(x), r1=144(y), r2=10(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 144
LDI r2, 10
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
