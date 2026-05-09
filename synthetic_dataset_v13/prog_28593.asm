; DESCRIPTION: Composite: Places a yellow circle of radius 46 at center (416, 166) then Renders a cyan line between points (43, 220) and (61, 128).
; PLAN: r0=416(x), r1=166(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x1), r6=220(y1), r7=61(x2), r8=128(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 166
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 220
LDI r7, 61
LDI r8, 128
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
