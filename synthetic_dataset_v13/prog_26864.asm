; DESCRIPTION: Renders a magenta disk with center (408, 146) and radius 77.
; PLAN: r0=408(x), r1=146(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 146
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
