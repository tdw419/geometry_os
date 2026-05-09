; DESCRIPTION: Places a magenta 107x59 rectangle at position (298, 65).
; PLAN: r0=298(x), r1=65(y), r2=107(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 65
LDI r2, 107
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
