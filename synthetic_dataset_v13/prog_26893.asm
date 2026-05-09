; DESCRIPTION: Places a cyan circle of radius 79 at center (307, 125).
; PLAN: r0=307(x), r1=125(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 125
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
