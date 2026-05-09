; DESCRIPTION: Composite: Renders a yellow line between points (267, 200) and (150, 166) then Places a green 106x91 rectangle at position (154, 57).
; PLAN: r0=267(x1), r1=200(y1), r2=150(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=57(y), r7=106(width), r8=91(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 200
LDI r2, 150
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 57
LDI r7, 106
LDI r8, 91
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
