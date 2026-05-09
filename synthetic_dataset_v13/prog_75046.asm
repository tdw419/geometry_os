; DESCRIPTION: Places a cyan line segment connecting (293, 239) to (294, 102).
; PLAN: r0=293(x1), r1=239(y1), r2=294(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 239
LDI r2, 294
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
