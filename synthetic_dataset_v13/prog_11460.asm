; DESCRIPTION: Places a green 102x76 rectangle at position (177, 167).
; PLAN: r0=177(x), r1=167(y), r2=102(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 167
LDI r2, 102
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
