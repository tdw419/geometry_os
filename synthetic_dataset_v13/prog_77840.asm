; DESCRIPTION: Draws a cyan line from (92, 21) to (256, 242).
; PLAN: r0=92(x1), r1=21(y1), r2=256(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 21
LDI r2, 256
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
