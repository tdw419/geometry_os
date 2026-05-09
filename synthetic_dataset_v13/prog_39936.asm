; DESCRIPTION: Places a green circle of radius 42 at center (116, 213).
; PLAN: r0=116(x), r1=213(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 213
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
