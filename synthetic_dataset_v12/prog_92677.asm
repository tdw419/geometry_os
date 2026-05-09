; DESCRIPTION: Places a red 44x91 rectangle at position (322, 149).
; PLAN: r0=322(x), r1=149(y), r2=44(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 149
LDI r2, 44
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
