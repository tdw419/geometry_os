; DESCRIPTION: Places a cyan circle of radius 59 at center (113, 178).
; PLAN: r0=113(x), r1=178(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 178
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
