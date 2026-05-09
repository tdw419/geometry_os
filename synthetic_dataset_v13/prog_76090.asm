; DESCRIPTION: Draws a magenta line from (274, 129) to (108, 228).
; PLAN: r0=274(x1), r1=129(y1), r2=108(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 129
LDI r2, 108
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
