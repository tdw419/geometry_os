; DESCRIPTION: Composite: Places a cyan circle of radius 62 at center (242, 78) then Places a orange line segment connecting (277, 168) to (161, 182).
; PLAN: r0=242(x), r1=78(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x1), r6=168(y1), r7=161(x2), r8=182(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 78
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 168
LDI r7, 161
LDI r8, 182
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
