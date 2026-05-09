; DESCRIPTION: Places a white 40x22 rectangle at position (294, 228).
; PLAN: r0=294(x), r1=228(y), r2=40(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 228
LDI r2, 40
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
