; DESCRIPTION: Places a white 38x46 rectangle at position (398, 159).
; PLAN: r0=398(x), r1=159(y), r2=38(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 159
LDI r2, 38
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
