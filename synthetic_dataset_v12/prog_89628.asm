; DESCRIPTION: Renders a cyan line between points (152, 28) and (338, 166).
; PLAN: r0=152(x1), r1=28(y1), r2=338(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 28
LDI r2, 338
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
