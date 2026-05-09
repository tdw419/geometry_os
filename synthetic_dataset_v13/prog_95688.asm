; DESCRIPTION: Places a blue circle of radius 50 at center (127, 186).
; PLAN: r0=127(x), r1=186(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 186
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
