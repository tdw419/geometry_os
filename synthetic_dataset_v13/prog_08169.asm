; DESCRIPTION: Renders a cyan line between points (410, 36) and (72, 150).
; PLAN: r0=410(x1), r1=36(y1), r2=72(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 36
LDI r2, 72
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
