; DESCRIPTION: Places a blue circle of radius 55 at center (352, 113).
; PLAN: r0=352(x), r1=113(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 113
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
