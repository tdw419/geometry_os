; DESCRIPTION: Composite: Renders a blue line between points (269, 196) and (224, 146) then Places a magenta circle of radius 19 at center (429, 202).
; PLAN: r0=269(x1), r1=196(y1), r2=224(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=202(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 269
LDI r1, 196
LDI r2, 224
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 202
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
