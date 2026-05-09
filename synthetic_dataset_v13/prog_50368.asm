; DESCRIPTION: Renders a yellow disk with center (202, 168) and radius 68.
; PLAN: r0=202(x), r1=168(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 168
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
