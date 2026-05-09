; DESCRIPTION: Renders a red disk with center (445, 127) and radius 59.
; PLAN: r0=445(x), r1=127(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 127
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
