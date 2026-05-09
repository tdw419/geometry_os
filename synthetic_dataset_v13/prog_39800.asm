; DESCRIPTION: Renders a blue box of size 27x74 starting at (439, 37).
; PLAN: r0=439(x), r1=37(y), r2=27(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 37
LDI r2, 27
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
