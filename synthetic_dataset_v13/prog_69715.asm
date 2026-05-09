; DESCRIPTION: Places a white 111x73 rectangle at position (226, 74).
; PLAN: r0=226(x), r1=74(y), r2=111(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 74
LDI r2, 111
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
