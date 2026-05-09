; DESCRIPTION: Places a white 111x106 rectangle at position (173, 22).
; PLAN: r0=173(x), r1=22(y), r2=111(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 22
LDI r2, 111
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
