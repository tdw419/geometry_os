; DESCRIPTION: Places a cyan line segment connecting (275, 146) to (242, 225).
; PLAN: r0=275(x1), r1=146(y1), r2=242(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 146
LDI r2, 242
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
