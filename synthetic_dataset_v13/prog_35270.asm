; DESCRIPTION: Renders a cyan line between points (173, 203) and (397, 125).
; PLAN: r0=173(x1), r1=203(y1), r2=397(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 203
LDI r2, 397
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
