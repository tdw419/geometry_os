; DESCRIPTION: Places a purple circle of radius 54 at center (445, 146).
; PLAN: r0=445(x), r1=146(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 146
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
