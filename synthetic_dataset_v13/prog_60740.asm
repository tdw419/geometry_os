; DESCRIPTION: Places a red 65x106 rectangle at position (322, 38).
; PLAN: r0=322(x), r1=38(y), r2=65(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 38
LDI r2, 65
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
