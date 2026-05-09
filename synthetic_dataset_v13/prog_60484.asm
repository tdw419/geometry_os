; DESCRIPTION: Places a cyan line segment connecting (243, 98) to (398, 209).
; PLAN: r0=243(x1), r1=98(y1), r2=398(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 98
LDI r2, 398
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
