; DESCRIPTION: Loads 33 into r1 and decrements it in a loop until zero.
; PLAN: r1=33(counter), r2=1(step). Loop: SUB r1, r2 then JNZ r1, loop.
LDI r1, 33
loop:
LDI r2, 1
SUB r1, r2
JNZ r1, loop
HALT
