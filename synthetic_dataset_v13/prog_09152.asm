; DESCRIPTION: Renders a green box of size 96x40 starting at (220, 143).
; PLAN: r0=220(x), r1=143(y), r2=96(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 143
LDI r2, 96
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
