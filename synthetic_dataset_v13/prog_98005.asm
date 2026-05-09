; DESCRIPTION: Places a red 75x56 rectangle at position (322, 192).
; PLAN: r0=322(x), r1=192(y), r2=75(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 192
LDI r2, 75
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
