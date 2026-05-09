; DESCRIPTION: Places a white 57x48 rectangle at position (202, 40).
; PLAN: r0=202(x), r1=40(y), r2=57(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 40
LDI r2, 57
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
