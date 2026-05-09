; DESCRIPTION: Places a orange 111x71 rectangle at position (239, 163).
; PLAN: r0=239(x), r1=163(y), r2=111(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 163
LDI r2, 111
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
