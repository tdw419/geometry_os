; DESCRIPTION: Places a red circle of radius 33 at center (420, 113).
; PLAN: r0=420(x), r1=113(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 113
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
