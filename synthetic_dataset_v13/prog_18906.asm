; DESCRIPTION: Draws a cyan line from (329, 149) to (294, 192).
; PLAN: r0=329(x1), r1=149(y1), r2=294(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 149
LDI r2, 294
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
