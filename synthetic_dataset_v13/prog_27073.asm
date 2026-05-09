; DESCRIPTION: Composite: Places a magenta line segment connecting (144, 25) to (130, 129) then Renders a cyan box of size 85x60 starting at (370, 5).
; PLAN: r0=144(x1), r1=25(y1), r2=130(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=5(y), r7=85(width), r8=60(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 25
LDI r2, 130
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 5
LDI r7, 85
LDI r8, 60
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
