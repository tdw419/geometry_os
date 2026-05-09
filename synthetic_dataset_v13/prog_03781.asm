; DESCRIPTION: Renders a green line between points (401, 111) and (242, 166).
; PLAN: r0=401(x1), r1=111(y1), r2=242(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 111
LDI r2, 242
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
