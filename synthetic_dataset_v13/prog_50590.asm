; DESCRIPTION: Places a white 111x91 rectangle at position (125, 83).
; PLAN: r0=125(x), r1=83(y), r2=111(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 83
LDI r2, 111
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
