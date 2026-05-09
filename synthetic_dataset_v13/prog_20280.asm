; DESCRIPTION: Places a red circle of radius 28 at center (280, 146).
; PLAN: r0=280(x), r1=146(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 146
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
