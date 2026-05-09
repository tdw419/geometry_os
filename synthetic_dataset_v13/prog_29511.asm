; DESCRIPTION: Composite: Places a magenta circle of radius 12 at center (286, 231) then Draws a magenta line from (357, 239) to (14, 215).
; PLAN: r0=286(x), r1=231(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x1), r6=239(y1), r7=14(x2), r8=215(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 231
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 239
LDI r7, 14
LDI r8, 215
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
