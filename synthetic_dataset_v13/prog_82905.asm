; DESCRIPTION: Places a red circle of radius 48 at center (140, 146).
; PLAN: r0=140(x), r1=146(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 146
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
