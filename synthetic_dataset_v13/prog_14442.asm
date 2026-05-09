; DESCRIPTION: Places a cyan line segment connecting (406, 239) to (214, 236).
; PLAN: r0=406(x1), r1=239(y1), r2=214(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 239
LDI r2, 214
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
