; DESCRIPTION: Composite: Places a magenta dot at position (346, 174) then Draws a green line from (153, 87) to (32, 69) then Renders a cyan disk with center (221, 171) and radius 63.
; PLAN: r0=346(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=153(x1), r6=87(y1), r7=32(x2), r8=69(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=171(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 174
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 87
LDI r7, 32
LDI r8, 69
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 171
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
