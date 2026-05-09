; DESCRIPTION: Places a yellow 77x43 rectangle at position (398, 193).
; PLAN: r0=398(x), r1=193(y), r2=77(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 193
LDI r2, 77
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
