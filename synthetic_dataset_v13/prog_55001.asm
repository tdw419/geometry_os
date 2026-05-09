; DESCRIPTION: Places a green 102x111 rectangle at position (17, 91).
; PLAN: r0=17(x), r1=91(y), r2=102(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 91
LDI r2, 102
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
