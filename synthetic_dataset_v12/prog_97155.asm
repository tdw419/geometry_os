; DESCRIPTION: Places a cyan line segment connecting (341, 243) to (346, 146).
; PLAN: r0=341(x1), r1=243(y1), r2=346(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 243
LDI r2, 346
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
