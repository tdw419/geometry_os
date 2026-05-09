; DESCRIPTION: Places a magenta circle of radius 80 at center (168, 146).
; PLAN: r0=168(x), r1=146(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 146
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
