; DESCRIPTION: Renders a cyan line between points (298, 129) and (504, 70).
; PLAN: r0=298(x1), r1=129(y1), r2=504(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 129
LDI r2, 504
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
