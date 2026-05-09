; DESCRIPTION: Renders a black box of size 57x48 starting at (180, 159).
; PLAN: r0=180(x), r1=159(y), r2=57(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 159
LDI r2, 57
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
