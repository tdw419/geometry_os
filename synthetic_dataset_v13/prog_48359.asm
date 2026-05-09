; DESCRIPTION: Places a magenta line segment connecting (242, 129) to (12, 174).
; PLAN: r0=242(x1), r1=129(y1), r2=12(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 129
LDI r2, 12
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
