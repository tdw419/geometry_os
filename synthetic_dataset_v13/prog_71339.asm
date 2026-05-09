; DESCRIPTION: Places a white 76x111 rectangle at position (46, 57).
; PLAN: r0=46(x), r1=57(y), r2=76(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 57
LDI r2, 76
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
