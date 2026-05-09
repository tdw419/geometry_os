; DESCRIPTION: Places a cyan 38x102 rectangle at position (341, 46).
; PLAN: r0=341(x), r1=46(y), r2=38(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 46
LDI r2, 38
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
