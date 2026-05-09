; DESCRIPTION: Places a cyan line segment connecting (4, 239) to (499, 126).
; PLAN: r0=4(x1), r1=239(y1), r2=499(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 239
LDI r2, 499
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
